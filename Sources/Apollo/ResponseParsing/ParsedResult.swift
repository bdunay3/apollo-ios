import ApolloAPI

/// A result parsed from GraphQL specification compliant response data.
public struct ParsedResult<Operation: GraphQLOperation>: Sendable {

  /// The parsed ``GraphQLResponse`` for the operation.
  public let result: GraphQLResponse<Operation>

  /// The parsed response data as a ``RecordSet`` suitable for writing to an ``ApolloStore``
  public let cacheRecords: RecordSet?

  /// Designated Initializer
  /// - Parameters:
  ///   - result: The parsed ``GraphQLResponse`` for the operation.
  ///   - cacheRecords: The parsed response data as a ``RecordSet`` suitable for writing to an ``ApolloStore``
  public init(result: GraphQLResponse<Operation>, cacheRecords: RecordSet?) {
    self.result = result
    self.cacheRecords = cacheRecords
  }
}

extension ParsedResult: Equatable where Operation.Data: Equatable {}
extension ParsedResult: Hashable where Operation.Data: Hashable {}
