--  Abstract Machine
--  © Reed Lake Axewielder 2025

with Ada.Text_IO;
with Binary_Tree;
with Tree_Node;
with Plane_Tessellation;

procedure Triangular_Tessellation_Binary_Trees is
   Tape : Binary_Tree.Tree_Access := new Binary_Tree.btree;
   Tess : Plane_Tessellation.PlTess_Access := new Plane_Tessellation.pltess;
begin
   Binary_Tree.Initialization (Tape, (2**4) - 1);
   Tree_Node.Print_Values (Tape.Root);

   Ada.Text_IO.Put_Line ("Plot");
   Plane_Tessellation.Set (Tess, 0.0, 0.0, 0.0);
   Plane_Tessellation.Print_Transform_Image (Tess);
   Plane_Tessellation.Set (Tess, 1.0, 0.0, -1.0);
   Plane_Tessellation.Print_Transform_Image (Tess);
   Plane_Tessellation.Set (Tess, 0.0, 1.0, -1.0);
   Plane_Tessellation.Print_Transform_Image (Tess);
   Plane_Tessellation.Set (Tess, -1.0, 1.0, 0.0);
   Plane_Tessellation.Print_Transform_Image (Tess);
   Plane_Tessellation.Set (Tess, -1.0, 0.0, 1.0);
   Plane_Tessellation.Print_Transform_Image (Tess);
   Plane_Tessellation.Set (Tess, 0.0, -1.0, 1.0);
   Plane_Tessellation.Print_Transform_Image (Tess);
   Plane_Tessellation.Set (Tess, 1.0, -1.0, 0.0);
   Plane_Tessellation.Print_Transform_Image (Tess);
   

end Triangular_Tessellation_Binary_Trees;
