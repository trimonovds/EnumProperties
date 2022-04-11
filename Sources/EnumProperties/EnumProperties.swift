import SwiftSyntax
import Foundation

public class Visitor: SyntaxVisitor {
    public private(set) var output: String = ""

    public override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
        print("extension \(node.identifier.withoutTrivia()) {", to: &self.output)
        return .visitChildren
    }

    public override func visitPost(_ node: EnumDeclSyntax) {
        print("}", to: &self.output)
    }

    public override func visit(_ node: EnumCaseElementSyntax) -> SyntaxVisitorContinueKind {
        let propertyType: String
        let pattern: String
        let returnString: String
        if let associatedValue = node.associatedValue {
            propertyType = associatedValue.parameterList.count == 1
                ? "\(associatedValue.parameterList.first!.type!)"
                : "(\(associatedValue.parameterList))"
            pattern = "guard case let .\(node.identifier)(value)"
            returnString = "value"
        } else {
            propertyType = "Void"
            pattern = "guard case .\(node.identifier)"
            returnString = "()"
        }
        print("  var \(node.identifier): \(propertyType)? {", to: &self.output)
        print("    \(pattern) = self else { return nil }", to: &self.output)
        print("    return \(returnString)", to: &self.output)
        print("  }", to: &self.output)
        let identifier = "\(node.identifier)"
        let capitalizedIdentifier = "\(identifier.first!.uppercased())\(identifier.dropFirst())"
        print("  var is\(capitalizedIdentifier): Bool {", to: &self.output)
        print("    return self.\(node.identifier) != nil", to: &self.output)
        print("  }", to: &self.output)
        return .skipChildren
    }
}