//
//  DetailedView.swift
//  Habit
//
//  Created by AustinEscalante on 4/16/21.
//
import CoreData
import SwiftUI

struct DetailedView: View {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var selectedTask: Activity_Entry? = nil
    @State var savedText: String = ""
    var category: Categories
    var entries:[Activity_Entry] = []
    
    init(category: Categories){
        self.category = category
        self.entries = fetchRecentEntries()
    }
    
    var body: some View {
//        do {
//        try self.managedObjectContext.save()
//            entries = fetchRecentEntries()
//        }
//        catch{}
        return NavigationView{
            List{
                /*CircleImage(image: category.image)
                 .offset(x:130.0, y: -10.0)
                 .padding(.bottom, -50)
                 */
                Section(header: Text("New Entry")){
                    HStack{
                        TextField("Description...", text: $savedText)
                        
                        if self.savedText.count >= 0 {
                            Button(action: {
                                HabitModel.create(self.savedText, category: self.category.categoryName, using: self.managedObjectContext)
                                self.savedText = ""
                               // self.entries = fetchRecentEntries()
                            })
                            {
                                Text("+")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .frame(width: 48, height: 48)
                                    .background(Color.purple)
                                    .cornerRadius(24)
                                    .padding(.all)
                            }
                        }
                        
                    }
                }
                
                Section(header: Text("Past Entries")) {
                    ForEach(entries, id: \.id) { entry in
                        Button(action: {
                            self.selectedTask = entry
                        }) {
                            TaskCell(entry: entry)
                        }
//                        let description:String = entry.activity_description ?? " "
//                        Text(description)
                        
                    }
                   // .onDelete(perform: deleteTasks(at:))
                }
                
            }
            
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text(category.categoryName))
            .navigationBarItems(trailing: EditButton())
            
        }
    }
    
    mutating func fetchRecentEntries()-> [Activity_Entry]{
        do {
            let request = Activity_Entry.fetchRequest() as NSFetchRequest<Activity_Entry>
            let predicate = NSPredicate(format: "category CONTAINS %@", category.categoryName)
            request.predicate = predicate
            entries = try context.fetch(request)
        }
        catch{
            fatalError(error.localizedDescription)
        }
    return entries
    }
}
    
    
//    func deleteTasks(at indexSet: IndexSet) {
//        indexSet.forEach { HabitModel.delete(goals: tasks[$0], using: self.managedObjectContext) }
//    }
    


struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(category: categories[1])
            .environment(\.managedObjectContext, HabitViewModel().managedObjectContext)
    }
}

