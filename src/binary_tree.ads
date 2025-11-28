with Tree_Node;
use Tree_Node;
with Plane_Tessellation;
use Plane_Tessellation;
package Binary_Tree is
   type btree;
   type Tree_Access is access btree;
   type btree is
      record
         Root : Node_Access := null;
         Size : Natural := 0;
      end record;
   procedure Initialization (This : Tree_Access;  S : Natural);
   procedure Print_Tree (node : Node_Access);
end Binary_Tree;