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
    @State var showAlert = false
    
    var body: some View {
        Button("Record", systemImage: "record.circle") {
            self.showAlert.toggle()
        }.alert(isPresented: $showAlert) { () -> Alert in
            Alert(
                title: Text("Do you want to record a meditation session of \(healthViewModel.meditationDuration) minutes?"),
                primaryButton: .default(Text("Yes"), action: {
                    healthViewModel.recordMeditationSession()
                }),
                secondaryButton: .cancel())
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
