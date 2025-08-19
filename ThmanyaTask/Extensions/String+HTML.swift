//
//  String+HTML.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import Foundation

extension String {
    func removingHTMLTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            .replacingOccurrences(of: "&[^;]+;", with: "", options: .regularExpression, range: nil)
    }
}
