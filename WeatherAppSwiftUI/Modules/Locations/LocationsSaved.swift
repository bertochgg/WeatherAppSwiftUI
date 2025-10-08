//
//  LocationsSaved.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 05/10/25.
//
import SwiftUI
import SwiftData

struct LocationsSaved: View {
    @Binding var selection: MyTab
    @Binding var isNewCitySearched: Bool
    @Environment(\.modelContext) private var context
    @Query(sort: \SavedCity.name, order: .forward) private var savedCities: [SavedCity]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 69/255, green: 39/255, blue: 139/255).opacity(0.65),
                        Color(red: 46/255, green: 51/255, blue: 90/255).opacity(2)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                if savedCities.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 64))
                            .foregroundStyle(.white.opacity(0.8))
                        Text("No saved locations yet")
                            .foregroundStyle(.white.opacity(0.9))
                            .font(.headline)
                    }
                }
                VStack {
                    List {
                        ForEach(savedCities, id: \.id) { city in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(city.name)
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundStyle(.white)
                                    Text("Updated \(city.lastUpdated.formatted(.dateTime.hour().minute()))")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.white.opacity(0.6))
                                }
                                Spacer()
                            }
                            .padding(.vertical, 8)
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 1)
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color.purple.opacity(0.25),
                                                Color.blue.opacity(0.25)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .shadow(radius: 4)
                            )
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    fetchTappedCity(city.name)
                                }
                            }
                        }
                        .onDelete(perform: deleteCities)
                    }
                    .scrollContentBackground(.hidden)
                    .listRowSpacing(8)
                    .environment(\.colorScheme, .dark)
                }
                .padding(.top, 20)

            }
            .navigationTitle("Saved cities")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .onDisappear {
                isNewCitySearched = false
            }
        }
    }
    
    // MARK: - Delete Support
    private func deleteCities(at offsets: IndexSet) {
        for index in offsets {
            context.delete(savedCities[index])
        }
        try? context.save()
    }
    
    private func fetchTappedCity(_ city: String) {
        isNewCitySearched = true
        UserDefaults.standard.set(city, forKey: "currentCity")
        selection = .home
    }
}


#Preview {
    LocationsSaved(selection: .constant(.home), isNewCitySearched: .constant(true))
        .modelContainer(setupMockData())
}

@MainActor func setupMockData() -> ModelContainer {
    let container = try! ModelContainer(
        for: SavedCity.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    let context = container.mainContext
    context.insert(SavedCity(name: "Tlaxcala"))
    context.insert(SavedCity(name: "Montréal"))
    context.insert(SavedCity(name: "Tokyo"))
    return container
}
