with Tree_Node;
package Binary_Tree is
   type btree;
   type Tree_Access is access btree;
   type btree is
      record
         Root : Tree_Node.Node_Access := null;
         Size : Natural := 0;
      end record;
   procedure Initialization (This : Tree_Access;  S : Natural);
end Binary_Tree;