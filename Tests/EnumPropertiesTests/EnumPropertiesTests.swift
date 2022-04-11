import XCTest
import SwiftSyntax
import EnumProperties
import SnapshotTesting

final class EnumPropertiesTests: XCTestCase {
    func testExample() throws {
      let fixturesDirURL = URL(fileURLWithPath: String(#file))
        .deletingLastPathComponent()
        .appendingPathComponent("Fixtures")
      let enumsFileURL = fixturesDirURL.appendingPathComponent("Enums.swift")
      let sourceFile = try SyntaxParser.parse(enumsFileURL)
      let visitor = Visitor()
      visitor.walk(sourceFile)
      assertSnapshot(matching: visitor.output, as: .lines)
    }
}
