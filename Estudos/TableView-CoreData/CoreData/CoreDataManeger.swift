//
//  CoreDataManeger.swift
//  TableView-Coredata
//
//  Created by Gui Reis on 18/01/22.
//

import CoreData
import Foundation

class CoreDataManeger {

    static let shared:CoreDataManeger = CoreDataManeger()
    
    private var mainContext: NSManagedObjectContext {
        return self.container.viewContext
    }
    
    // MARK: - Core Data stack
    
    private lazy var container: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "TableView_Coredata")
        container.loadPersistentStores() {_, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()


    
    // MARK: - Core Data Saving support
    
    public func saveContext() -> Void {

        if self.mainContext.hasChanges {
            do {
                try self.mainContext.save()
            } catch(let errorGenerated) {
                print("Erro na hora de salvar \(errorGenerated)")
                fatalError("Unresolved error \(errorGenerated)")
            }
        }
    }
    
    
    
    
    /// Pega todos os encontros criados
    public func getMeetingsCreated() -> [Meetings] {
        let fr = NSFetchRequest<Meetings>(entityName: "Meetings")
        do {
            return try self.mainContext.fetch(fr)
        }catch {
            print(error)
        }
        return []
    }
    
    
    /// Adiciona um novo encontro no core data
    public func newMeeting(data: MeetingCreated) throws -> Meetings {
        let meeting = Meetings(context: self.mainContext)
        
        meeting.address = data.address
        meeting.city = data.city
        meeting.country = data.country
        meeting.date = data.date
        meeting.district = data.district
        meeting.hour = data.hour
        meeting.latitude = data.latitude
        meeting.longitude = data.longitude
        meeting.name = data.name
        meeting.number = data.number
        meeting.type = data.type
        
        self.saveContext()
        return meeting
    }
}

