import Foundation
import EnumProperties
import SwiftSyntax

let urls = CommandLine.arguments.dropFirst().map(URL.init(fileURLWithPath:))
let visitor = Visitor()

try urls.forEach { url in
    let tree = try SyntaxParser.parse(url)
    visitor.walk(tree)
}

print(visitor.output)