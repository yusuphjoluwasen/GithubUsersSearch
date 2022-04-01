//
//  NetworkRx.swift
//  Network
//
//  Created by Guru on 27/03/2022.
//

import Foundation
import RxSwift

public struct NetworkingRX {
    
    public init(){}
    
    public func performGetRequestWithQueryParameter<R:Codable,T: Codable>(endpoint: EndpointType,
                                                                          returnType: T.Type,
                                                                          request:R, params:Params
    ) -> Observable<NetworkResult<T>>
    {
        return Observable.create{ observer in
            
            let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
            let urlComponents = NSURLComponents(string: urlString ?? "")!
            urlComponents.queryItems = [
                URLQueryItem(name: params.key ?? "", value: params.value)
            ]
            guard let urlRequest = urlComponents.url else { return Disposables.create {
                observer.onError(MyError(msg: "Invalid URL"))
                }
            }
            
            var endpointRequest = URLRequest(url: urlRequest)
            endpointRequest.httpMethod = "GET"
            endpointRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let urlSession = URLSession.shared.dataTask(with: endpointRequest) { (data, urlResponse, error) in
                if let _ = error {
                    print("❌  Error :\(urlString ?? "") \n\(error?.localizedDescription ?? "Bad request")")
                    observer.onNext(.error(error))
                    return
                }
                
                if let _ = error?.isConnectivityError {
                    print("❌  Error : Due to Network Connectivity")
                    observer.onNext(.error(MyError(msg: "Please Check Your Internet Connection")))
                    return
                }
                
                guard let data = data else {
                    print("❌  Error :\(urlString ?? "") ")
                    observer.onNext(.error(nil))
                    return
                }
                
                let response = Response(data: data)
                guard let decoded = response.decode(returnType) else {
                    print("❌  Error Decoding Response : \(urlString ?? "")")
                    observer.onNext(.error(nil))
                    return
                }
                print("✅  Response: \(urlString ?? "") \n \(decoded)\n")
                observer.onNext(.success(decoded))
            }
            urlSession.resume()
            return Disposables.create {
                urlSession.cancel()
            }
        }
    }
}

