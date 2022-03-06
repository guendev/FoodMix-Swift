// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SubNotifySubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription SubNotify {
      subNotify {
        __typename
        user {
          __typename
          id
        }
        msg
        error
      }
    }
    """

  public let operationName: String = "SubNotify"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subNotify", type: .object(SubNotify.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subNotify: SubNotify? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "subNotify": subNotify.flatMap { (value: SubNotify) -> ResultMap in value.resultMap }])
    }

    public var subNotify: SubNotify? {
      get {
        return (resultMap["subNotify"] as? ResultMap).flatMap { SubNotify(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "subNotify")
      }
    }

    public struct SubNotify: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Notify"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
          GraphQLField("msg", type: .nonNull(.scalar(String.self))),
          GraphQLField("error", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(user: User, msg: String, error: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Notify", "user": user.resultMap, "msg": msg, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var msg: String {
        get {
          return resultMap["msg"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "msg")
        }
      }

      public var error: Bool? {
        get {
          return resultMap["error"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}
