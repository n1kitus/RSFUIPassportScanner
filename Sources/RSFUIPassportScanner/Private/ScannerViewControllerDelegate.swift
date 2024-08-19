//
//  File.swift
//
//
//  Created by Nikita Dobrov on 19/08/2024.
//

import Foundation
import MRZScanner

protocol ScannerViewControllerDelegate: AnyObject {
    func onScanError(_ error: Error) -> Void
    func onScanSuccess(_ result: ParsedResult) -> Void
}
