import XCTest
import SwiftSyntax
import EnumProperties
import SnapshotTesting

final class ReorderClassMembersSyntaxRewriterTests: XCTestCase {
    func testReorder() throws {
      let url = URL(fileURLWithPath: String(#file))
        .deletingLastPathComponent()
        .appendingPathComponent("Fixtures")
        .appendingPathComponent("Classes.swift")
      let sourceFile = try! SyntaxParser.parse(url)
      let rewriter = ReorderClassMembersSyntaxRewriter()
      _ = rewriter.visit(sourceFile)
    }
}
