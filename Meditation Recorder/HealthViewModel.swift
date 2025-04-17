//
//  HealthViewModel.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import Foundation

@Observable
class HealthViewModel {
    let meditationDuration = 30
    var endDate = Date()
    var startDate: Date {
        Calendar.current.date(
            byAdding: .minute,
            value: -meditationDuration,
            to: endDate)!
    }
    
    func onChangeScenePhase() {
        requestAuthorization()
        updateEndDate()
    }
    
    func requestAuthorization() {
        HealthKitManager.shared.requestAuthorization()
    }
    
    func updateEndDate(_ date: Date = Date()) {
        endDate = date
    }
    
    func recordMeditationSession() {
        HealthKitManager.shared.recordMeditationSession(duration: meditationDuration, endDate: endDate)
    }
}
