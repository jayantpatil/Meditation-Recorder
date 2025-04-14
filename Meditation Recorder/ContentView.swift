//
//  ContentView.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var healthViewModel: HealthViewModel
  
    var body: some View {
        Button("Record", systemImage: "record.circle") {
            healthViewModel.recordMeditationSession()
        }
        .tint(.red)
        .font(.largeTitle)
        .onAppear {
            healthViewModel.requestAuthorization()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(HealthViewModel())
}
