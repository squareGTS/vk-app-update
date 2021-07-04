//
//  WebViewController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 26.06.2021.
//

import UIKit
import WebKit
import SwiftKeychainWrapper

class WebViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView! {
        didSet {
            webview.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let token = KeychainWrapper.standard.string(forKey: "vkToken") {
//            Session.shared.token = token
//            Session.shared.userId = KeychainWrapper.standard.string(forKey: "userId") ?? ""
//            showMainTabBar()
//            return
//        }
        
        authVK()
    }
    
    //TODO: - create a service if need
     func authVK() {
         var urlComponents = URLComponents()
         //7889278
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7889278"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "270342"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
    }
}

//MARK: - WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        //Теперь мы можем отслеживать все переходы и отменять либо разрешать их по необходимости.
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        /*
         Первая часть кода проверяет URL, на который было совершено перенаправление. Если это нужный нам URL (/blank.html), и в нем есть токен, приступим к его обработке, если же нет, дадим зеленый свет на переход между страницами c помощью метода decisionHandler(.allow). Дальше мы просто режем строку с параметрами на части, используя как разделители символы & и =. В результате получаем словарь с параметрами.
         */
        
        //TODO: - Redisign thus part of code
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        
        //TODO: - track token
        //Токен имеет ключ “access_token”, Мы можем получить его и использовать в наших запросах к ВК.
        if let token = params["access_token"], let userId = params["user_id"] {
            print("TOKEN = \(token)" as Any)
            
            KeychainWrapper.standard.set(token, forKey: "vkToken")
            KeychainWrapper.standard.set(token, forKey: "userId")
            
            Session.shared.token = token
            Session.shared.userId = userId
            
            showMainTabBar()
        }
        
        decisionHandler(.cancel)
    }
    
    
    
    //MARK: -
func showMainTabBar() {
    performSegue(withIdentifier: "showFriendsSegue", sender: self)
}
}
