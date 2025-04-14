//
//  HealthKitManager.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import HealthKit

class HealthKitManager {
    public static let shared = HealthKitManager()
    private let healthStore = HKHealthStore()
    
    private init() {}
    
    // Request authorization to write meditation data
    func requestAuthorization(mindfulType: HKCategoryType? = HKObjectType.categoryType(forIdentifier: .mindfulSession)) {
        guard let mindfulType else { return }
        
        let typesToWrite: Set = [mindfulType]
        let typesToRead: Set = [mindfulType]
        healthStore.requestAuthorization(toShare: typesToWrite, read: typesToRead) { success, error in
            print("Success \(success)")
            print("Error \(error)")
            
            if !success {
                print("Error requesting HealthKit authorization: \(error!)")
            }
        }
    }
    
    func recordMeditationSession(duration meditationDuration: Int,
                                 mindfulType: HKCategoryType? = HKObjectType.categoryType(forIdentifier: .mindfulSession)) {
        guard let mindfulType else { return }
        
        let endDate = Date()
        let startDate = Calendar.current.date(
            byAdding: .minute,
            value: -meditationDuration,
            to: endDate)!
        
        /* The duration of mindful minutes is described by its start and end,
         while the value is simply filled with the value 0. */
        let sample = HKCategorySample(
            type: mindfulType,
            value: 0,
            start: startDate,
            end: endDate)
        
        healthStore.save(sample) { success, error in
            print("Success \(success)")
            print("Error \(error)")
        }
        
    }
}
