//
//  ContentView.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    let meditationDuration = 30
    var body: some View {
        Button("Record", systemImage: "record.circle") {
            let endDate = Date()
            let startDate = Calendar.current.date(
                byAdding: .minute,
                value: -meditationDuration,
                to: endDate)!
        }
        .tint(.red)
        .font(.largeTitle)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
