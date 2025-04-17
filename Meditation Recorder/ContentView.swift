//
//  ContentView.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var healthViewModel: HealthViewModel
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .trailing) {
                Text("Start Time \(healthViewModel.startDate.formatted(date: .abbreviated, time: .standard))")
                
                Text("End Time \(healthViewModel.endDate.formatted(date: .abbreviated, time: .standard))")
                
                Text("Duration \(healthViewModel.meditationDuration) minutes")
            }
            .foregroundStyle(.gray)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5])) // Dotted border
                    .foregroundColor(.mint) // Border color
            )
            .padding()
            
            Image(systemName: "apple.meditate" )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Color(red: 0.2, green: 0.8, blue: 0.2))
                .frame(width: 75, height: 75)
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
            
        }
        .symbolEffect(.breathe)
        .onAppear {
            healthViewModel.requestAuthorization()
        }
    }
}

#Preview {
    ContentView(healthViewModel: HealthViewModel())
}
