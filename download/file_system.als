module file_system

abstract sig Object {}

sig Name {}

sig File extends Object {} 

sig Dir extends Object {
	contents: Name -> lone Object,
	parent: lone Dir
} 

one sig Root extends Dir {} 

pred parentIsWellDefined[d: Dir] { d.parent = (contents.d) . Name }

fact ParentDefinition { all d: Dir | parentIsWellDefined[d] }

fact RootHasNoParent { all r: Root | no r.parent  }

fun ancestors[d: Dir]: Dir { d.^parent }

fact NoOwnAncestor { all d: Dir | d !in ancestors[d] }

fact RootIsTheRoot { all d: Dir - Root | Root in ancestors[d] }

fact OneParent { all d: Dir | d !in Root => (one d.parent && one contents.d) }

assert Lemma1 {
  all o: Dir | no contents.o . Name => no contents.o
}


assert NoDirAliases {
    all o: Dir | lone (contents.o)
} 
check NoDirAliases for 4


run {}
