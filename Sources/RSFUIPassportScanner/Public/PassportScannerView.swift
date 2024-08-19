//
//  SwiftUIView.swift
//
//
//  Created by Nikita Dobrov on 19/08/2024.
//

import MRZScanner
import SwiftUI

/// This view displays a camera with an a highlighted region of interest. Only text that is inside the region of interest will be detected. Other areas of the camera viewfinder will be ignored.
public struct PassportScannerView: View {
    /// This binding will be updated when valid information is detected. Set to **nil** before trying to scan any new information. Scanning will be disabled when this variably is not set to **nil**
    @Binding var result: PassportInfo?

    @State private var scanningEnabled: Bool = true
    @State private var error: Error? = nil
    @State private var presentError = false

    public var body: some View {
        PassportScanner(
            result: $result,
            error: $error,
            scanningEnabled: $scanningEnabled
        )
        .alert("scan_error", isPresented: $presentError) {
            Button(role: .cancel) {
                presentError = false
            } label: {
                Text("ok")
            }
        }
        .onChange(of: result, perform: { r in
            scanningEnabled = r == nil
        })
        .onDisappear(perform: {
            scanningEnabled = false
        })
        .onAppear(perform: {
            scanningEnabled = true
        })
    }

    public init(result: Binding<PassportInfo?>) {
        _result = result
    }
}

#Preview {
    PassportScannerView(result: .constant(nil))
}
