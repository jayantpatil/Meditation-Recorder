//
//  Meditation_RecorderApp.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import SwiftUI
import SwiftData

@main
struct Meditation_RecorderApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HealthViewModel())
        }
    }
}
