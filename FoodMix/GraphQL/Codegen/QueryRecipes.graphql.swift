// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class HomeUpdatedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HomeUpdated($filter: SortOption!) {
      getRecipes(filter: $filter) {
        __typename
        id
        name
        slug
        avatar
        content
        totalRating
        countRating
        user {
          __typename
          id
          name
          slug
          avatar
        }
      }
    }
    """

  public let operationName: String = "HomeUpdated"

  public var filter: SortOption

  public init(filter: SortOption) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getRecipes", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetRecipe.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getRecipes: [GetRecipe?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getRecipes": getRecipes.map { (value: GetRecipe?) -> ResultMap? in value.flatMap { (value: GetRecipe) -> ResultMap in value.resultMap } }])
    }

    public var getRecipes: [GetRecipe?] {
      get {
        return (resultMap["getRecipes"] as! [ResultMap?]).map { (value: ResultMap?) -> GetRecipe? in value.flatMap { (value: ResultMap) -> GetRecipe in GetRecipe(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetRecipe?) -> ResultMap? in value.flatMap { (value: GetRecipe) -> ResultMap in value.resultMap } }, forKey: "getRecipes")
      }
    }

    public struct GetRecipe: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Recipe"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("countRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String, slug: String, avatar: String, content: String, totalRating: Int, countRating: Int, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "content": content, "totalRating": totalRating, "countRating": countRating, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var slug: String {
        get {
          return resultMap["slug"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "slug")
        }
      }

      public var avatar: String {
        get {
          return resultMap["avatar"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var totalRating: Int {
        get {
          return resultMap["totalRating"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalRating")
        }
      }

      public var countRating: Int {
        get {
          return resultMap["countRating"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countRating")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String, slug: String, avatar: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "slug": slug, "avatar": avatar])
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

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var slug: String {
          get {
            return resultMap["slug"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "slug")
          }
        }

        public var avatar: String? {
          get {
            return resultMap["avatar"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
          }
        }
      }
    }
  }
}
