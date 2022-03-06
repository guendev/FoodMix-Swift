//
//  Network.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import Foundation
import Apollo
import ApolloWebSocket

class Network {
    
    static let shared = Network()
    
    static var token: String = {
        return UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
    }()

    private(set) lazy var apollo: ApolloClient = {
    
        
        /// An HTTP transport to use for queries and mutations
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["Authorization": "Bearer \(Network.token)"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
                
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
                
        let url = URL(string: "http://localhost:3000/graphql")!
                
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        /// A web socket transport to use for subscription
        
        let urlWs = URL(string: "ws://localhost:3000/graphql")!
        let webSocketClient = WebSocket(url: urlWs, protocol: .graphql_ws)
        let wsTransport = WebSocketTransport(websocket: webSocketClient)
        
        var splitNetworkTransport = SplitNetworkTransport(
            uploadingNetworkTransport: requestChainTransport,
            webSocketNetworkTransport: wsTransport
          )
                
        return ApolloClient(networkTransport: splitNetworkTransport, store: store1)
        
    }()
    
}


class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        request.addHeader(name: "Authorization", value: "Bearer \(Network.token)")
        
        print("request :\(request)")
        print("response :\(String(describing: response))")
        
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
