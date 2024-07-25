
enum Position {
    case cashier
    case cook
}

struct Employee {
    let name: String
    let salary: Double
    let position: Position
}

class Table {
    let seats: Int
    weak var pizzeria: Pizzeria?
    
    
    init(seats: Int, pizzeria: Pizzeria) {
        self.seats = seats
        self.pizzeria = pizzeria
    }
    
    
    func canSeat(guests: Int) -> Bool {
        return guests <= seats
    }
}


class Pizzeria {
    var employees: [Employee] = []
    var tables: [Table] = []
    
    // Инициализатор для создания пиццерии с заданным количеством столиков
    init(numberOfTables: Int, seatsPerTable: Int) {
        for _ in 0..<numberOfTables {
            let table = Table(seats: seatsPerTable, pizzeria: self)
            tables.append(table)
        }
    }
}


let pizzeria = Pizzeria(numberOfTables: 5, seatsPerTable: 4)

let employee1 = Employee(name: "Александр Смирнов", salary: 15000.0, position: .cashier)
let employee2 = Employee(name: "Иван Иванов", salary: 20000.0, position: .cook)

pizzeria.employees.append(employee1)
pizzeria.employees.append(employee2)


for table in pizzeria.tables {
    print("Table with \(table.seats) seats in pizzeria.")
}


let table = pizzeria.tables[0]
print(table.canSeat(guests: 3))  // true
print(table.canSeat(guests: 5))  // false
