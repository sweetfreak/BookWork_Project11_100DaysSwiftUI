//
//  ContentView.swift
//  Bookworm_Project11
//
//  Created by Jesse Sheehan on 9/5/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    
    var body: some View {
        NavigationStack {
            //Text("Count: \(books.count)")
            List {
                ForEach(books) {book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
}

//DAY 53 - Binding, texteditor, SwiftData/Model

//struct ContentView: View {
//    //reads out the model contexsxt that was made earlier
//    //ModelContext - puts data in RAM memory so it's live/fast, and not being written/read, etc - needed forabout all apps that save data (most apps)
//    @Environment(\.modelContext) var modelContext
//    
//    //@Query tells swift to find and load the info for us.
//    @Query var students: [Student]
//    
//    var body: some View {
//        NavigationStack {
//            List(students) {student in
//                Text(student.name)
//            }
//            .navigationTitle("Classroom")
//            .toolbar {
//                Button("add") {
//                    let firstNames = ["Derek", "Wyatt", "Nick", "Ian", "Jesse"]
//                    let lastNames = ["Swanson", "Morly", "Lamb", "Cardone", "Sheehan"]
//                    
//                    let chosenFirstName = firstNames.randomElement()!
//                    let chosenLastName = lastNames.randomElement()!
//                    
//                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
//                    
//                    modelContext.insert(student)
//                }
//            }
//        }
//    }
//}



//struct ContentView: View {
//    
//    @AppStorage("notes") private var notes = ""
//    
//    var body: some View {
//        
//        NavigationStack {
// //            TextEditor(text: $notes) // this is for the whole page
//            TextField("Enter Your Text", text: $notes, axis: .vertical) // adding the axis makes the text field grow!
//                .textFieldStyle(.roundedBorder)
//                .navigationTitle("Notes")
//                .padding()
//        }
//    }
//}

// @BINDING

//struct PushButtonView: View {
//    let title: String
//    @Binding var isOn: Bool
//    
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white:0.6), Color(white: 0.4)]
//    
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(.linearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
//        .foregroundColor(.white)
//        .clipShape(.capsule)
//        .shadow(radius: isOn ? 0 : 5)
//    }
//    
//}


//struct ContentView: View {
//    
//    @State private var rememberMe = false
//    
//    //NOTES
//    // @Bindable is used when accessing a shared CLASS that uses the @Observable Macro. You create it with @State in the starting view, but then you can also access it in other views, so bindings can be created there, too.
//    
//    // @Binding however, is used when you have a simple value type - a bool, string, double, array, etc - rather than a whole separate class. They do NOT used the @Observable. just the @Binding in place of @State
//    
//    var body: some View {
//        
//        VStack {
//            PushButtonView(title: "Remember Me", isOn: $rememberMe)
//            //without @Binding in the other view and the "$" here, the text below won't change! Because of the button above, the view above changes, but stops there - it doesn't get back to the content view and change it here. It kind of creates a "rememberMe" in the other view and then forgets to update it in the initial view. Don't forget, it's just a view, not an actual button. If PushButtonView had @State
//            Text(rememberMe ? "On" : "Off")
//        }
//        
//        //Toggle("Remember me", isOn: $rememberMe)
//        
//        
//        
//        
//    }
//}


#Preview {
    ContentView()
}
