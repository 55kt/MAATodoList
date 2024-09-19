import SwiftUI

struct DateHeaderView: View {
    // MARK: - Properties
    @EnvironmentObject var dateManager: DateManager
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                nameHeaderTextView()
            }
        }
    }
    
    // MARK: - Methods & Extensions
    @ViewBuilder
    private func nameHeaderTextView() -> some View {
        HStack {
            // Title
            VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                Text("Title")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(4)
                
                // Description
                Text(dateManager.selectedDate == Calendar.current.startOfDay(for: Date()) ? "What's up for today?" : "Planing for future?")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.black)
                    .padding(4)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(dateManager.selectedDate.monthToString())
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                
                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        dateManager.selectToday()
                    }
                } label: {
                    Text("Today")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(4)
                        .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))                        }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    DateHeaderView()
        .environmentObject(DateManager())
}
