//
//  NetworkError.swift
//  
//
//  Created by Talip on 3.06.2023.
//

public enum NetworkError: Error, Equatable {
    case invalidUrl
    case requestFailed
    case invalidData
}
