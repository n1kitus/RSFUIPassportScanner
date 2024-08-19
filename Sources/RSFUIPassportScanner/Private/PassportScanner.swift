//
//  PassportScanner.swift
//
//
//  Created by Nikita Dobrov on 19/08/2024.
//

import MRZScanner
import SwiftUI

struct PassportScanner: UIViewControllerRepresentable {
    @Binding var result: PassportInfo?
    @Binding var error: Error?
    @Binding var scanningEnabled: Bool

    class Coordinator: NSObject, ScannerViewControllerDelegate {
        func onScanError(_ error: any Error) {
            parent.error = error
        }

        func onScanSuccess(_ result: MRZScanner.ParsedResult) {
            parent.result = PassportInfo.from(result)
        }

        var parent: PassportScanner

        init(_ parent: PassportScanner) {
            self.parent = parent
        }
    }

    func makeUIViewController(context: Context) -> ScannerViewController {
        let scanner = ScannerViewController()
        scanner.delegate = context.coordinator
        return scanner
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        uiViewController.scanningIsEnabled = scanningEnabled
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
