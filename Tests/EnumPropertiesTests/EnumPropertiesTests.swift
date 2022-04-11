import XCTest
import SwiftSyntax
import EnumProperties
import SnapshotTesting

extension Snapshotting where Value == URL, Format == String {
  static let enumProperties: Snapshotting = {
    var snapshotting: Snapshotting = Snapshotting<String, String>.lines.pullback { url in
      let sourceFile = try! SyntaxParser.parse(url)
      let visitor = Visitor()
      visitor.walk(sourceFile)
      return visitor.output
    }
    snapshotting.pathExtension = "swift"
    return snapshotting
  }()
}

final class EnumPropertiesTests: XCTestCase {
    func testExample() throws {
      let url = URL(fileURLWithPath: String(#file))
        .deletingLastPathComponent()
        .appendingPathComponent("Fixtures")
        .appendingPathComponent("Enums.swift")
      assertSnapshot(matching: url, as: .enumProperties)
    }
}
