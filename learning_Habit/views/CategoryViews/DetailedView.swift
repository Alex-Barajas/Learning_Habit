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
    
    @FetchRequest(fetchRequest: Activity_Entry.fetchAll()) var entries: FetchedResults<Activity_Entry>
    
    
    @State var selectedTask: Activity_Entry? = nil
    @State var savedText: String = ""
    @State var newState: String = ""
    var category: Categories
    
    
    var body: some View {
        
        let predicate = NSPredicate(format: "category CONTAINS %@", category.categoryName)
        let request = NSFetchRequest<Activity_Entry>(entityName: "Activity_Entry")
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "category", ascending: true)]
        
        return NavigationView{
            VStack{
                 category.image
                        .position(x: 200, y: -28)
                        .frame(width: 120, height: 50)
            List{
                Section(header: Text("New Entry")){
                    
                    HStack{
                        TextField("Description...", text: $savedText)
                        
                        if self.savedText.count > 0 {
                            Button(action: {
                                HabitModel.create(self.savedText, category: self.category.categoryName, using: self.managedObjectContext)
                                self.savedText = ""
                                newState = savedText
                                print("FRE in button called")
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
                prevItemView(list: FetchRequest(fetchRequest: request))
                
            }
            
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text(category.categoryName))
            .navigationBarItems(trailing: EditButton())
           
            }
            .padding(.top)
        }
    }
    
    

}

struct prevItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest var list: FetchedResults<Activity_Entry>
    var body: some View {
        Section(header: Text("Past Entries")) {
            
            ForEach(list, id: \.id) { entry in
                ScrollView(.vertical){
                let temp = (entry.activity_description ?? "Error") as String
                Text(temp)
                }
            }
            .onDelete(perform: deleteTasks(at:))
            
            
        }
        
    }
    func deleteTasks(at indexSet: IndexSet) {
          indexSet.forEach { HabitModel.delete(goals: list[$0], using: self.managedObjectContext) }
      }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(category: categories[1])
            .environment(\.managedObjectContext, HabitViewModel().managedObjectContext)
    }
}










