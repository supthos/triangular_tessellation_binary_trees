with Ada.Containers;
with Ada.Containers.Vectors;
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
   package Tree_Vector is new Ada.Containers.Vectors
      (Index_Type => Natural, Element_Type => Tree_Access);
   procedure Initialization (This : Tree_Access;  S : Natural);
   procedure Print_Tree (node : Node_Access);
   function Next_Degree (TVec : Tree_Vector.Vector) return Tree_Vector.Vector;
   procedure Copy_Tree (This : in out Node_Access; Other: in Node_Access);
   procedure Copy (This: in out Tree_Access; Other: in Tree_Access) ;
   
end Binary_Tree;