//
//  HealthViewModel.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import Foundation

class HealthViewModel: ObservableObject {
    let meditationDuration = 30
    let endDate = Date()
    var startDate: Date {
        Calendar.current.date(
            byAdding: .minute,
            value: -meditationDuration,
            to: endDate)!
    }
    
    func requestAuthorization() {
        HealthKitManager.shared.requestAuthorization()
    }
    
    func recordMeditationSession() {
        HealthKitManager.shared.recordMeditationSession(duration: meditationDuration, endDate: endDate)
    }
}
