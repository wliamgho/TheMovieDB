//
//  NetworkManager.swift
//  TheMovieDB
//
//  Created by William on 04/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Alamofire

public protocol NetworkRequest {
    typealias Completion<T> = (Swift.Result<T, AFError>) -> Void
    func request<T: Decodable>(_ url: URLRequestConvertible,
                               decoder: JSONDecoder,
                               completion: @escaping Completion<T>)
}

struct NetworkManager {
    private var session: SessionRequest

    init(_ session: SessionRequest = NetworkSession()) {
        self.session = session
    }
}

extension NetworkManager: NetworkRequest {
    func request<T>(_ url: URLRequestConvertible, decoder: JSONDecoder, completion: @escaping Completion<T>) where T : Decodable {
        session.dataRequest(urlRequest: url).responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
