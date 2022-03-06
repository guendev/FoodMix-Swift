// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SigninMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Signin($input: SignInInput!) {
      signin(input: $input) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "Signin"

  public var input: SignInInput

  public init(input: SignInInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signin", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(Signin.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signin: Signin) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signin": signin.resultMap])
    }

    public var signin: Signin {
      get {
        return Signin(unsafeResultMap: resultMap["signin"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "signin")
      }
    }

    public struct Signin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Token"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "Token", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class SignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Signup($input: SignUpInput!) {
      signup(input: $input) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "Signup"

  public var input: SignUpInput

  public init(input: SignUpInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(Signup.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: Signup) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup.resultMap])
    }

    public var signup: Signup {
      get {
        return Signup(unsafeResultMap: resultMap["signup"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "signup")
      }
    }

    public struct Signup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Token"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "Token", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}
