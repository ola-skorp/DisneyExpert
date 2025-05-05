//
//  Database.swift
//  DisneyExpert
//
//  Created by Ольга on 29.04.25.
//

import Foundation
import SQLite3
import DomainModule

class Database{
    var db: OpaquePointer? = nil
    
    func openDatabase() {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("MyDB")
            
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            debugPrint("Cannot open DB.")
        } else {
            print("DB successfully created.")
        }
    }
    
    func createCharacterTable() {
        let createTableString = """
               CREATE TABLE IF NOT EXISTS Character (
                   id INTEGER PRIMARY KEY,
                   name TEXT,
                   movie TEXT
               );
           """

        var createTableStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("User table is created successfully.")
            } else {
                print("User table creation failed.")
            }
        } else {
            print("User table creation failed.")
        }

        sqlite3_finalize(createTableStatement)
    }
    
    func insertCharacter(id: Int, name: String, movie: String) -> Bool{
        let insertStatementString = "INSERT INTO Character (id, name, movie) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
            
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (movie as NSString).utf8String, -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Character is created successfully.")
                sqlite3_finalize(insertStatement)
                return true
            } else {
                print("Could not add.")
                return false
            }
        } else {
            print("INSERT statement is failed.")
            return false
        }
    }
    
    func deleteCharacter(id: Int) -> Bool{
        let deleteStatementString = "DELETE FROM Character WHERE id==?;"
        var deleteStatement: OpaquePointer? = nil
            
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))

            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("User is deleted successfully.")
                sqlite3_finalize(deleteStatement)
                return true
            } else {
                print("Could not delete.")
                return false
            }
        } else {
            print("DELETE statement is failed.")
            return false
        }
    }
    
    func getAllCharacters() -> [Character] {
        let queryStatementString = "SELECT * FROM Character;"
        var queryStatement: OpaquePointer? = nil
        var users : [Character] = []
        if sqlite3_prepare_v2(db,  queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let movie = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                    
                users.append(Character(id: Int(id), name: name, movie: movie, isFavorite: false))
                print("Character Details:")
                print("\(id) | \(name) | \(movie)")
            }
        } else {
            print("SELECT statement is failed.")
        }
        sqlite3_finalize(queryStatement)
        return users
    }
}
