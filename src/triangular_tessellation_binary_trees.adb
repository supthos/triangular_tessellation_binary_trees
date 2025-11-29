--  Abstract Machine
--  © Reed Lake Axewielder 2025

with Ada.Text_IO;
with Binary_Tree;
use Binary_Tree;
with Tree_Node;
with Plane_Tessellation;
use Plane_Tessellation;

procedure Triangular_Tessellation_Binary_Trees is
   Tape : Tree_Access := new btree;
   Tess : PlTess_Access := new pltess;
   P_Vector : Point_Vector.Vector;
   Q_Vector : Point_Vector.Vector;
   R_Vector : Point_Vector.Vector;
   -- Graph : Plane_Tessellation.Point_Vector.Vector;
   T_Vector : Tree_Vector.Vector;
begin
   Binary_Tree.Initialization (Tape, 0);
   Tree_Vector.Append(T_Vector, Tape);
   T_Vector := Next_Degree (T_Vector);
   for tree of T_Vector loop
      Binary_Tree.Print_Tree (tree.Root);
   end loop;

   --  Ada.Text_IO.Put_Line ("Plot");
   --  Plane_Tessellation.Set (Tess, 0.0, 0.0, 0.0);
   --  P_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, 0.0, -1.0);
   --  P_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 0.0, 1.0, -1.0);
   --  P_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, -1.0, 1.0, 0.0);
   --  P_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, -1.0, 0.0, 1.0);
   --  P_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 0.0, -1.0, 1.0);
   --  P_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, -1.0, 0.0);
   --  P_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   
   --  Ada.Text_IO.Put_Line ("Plot");
   --  Plane_Tessellation.Set (Tess, 0.0, 0.0, 0.0);
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, 1.0, -2.0);
   --  R_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, -1.0, 2.0, -1.0);
   --  R_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, -2.0, 1.0, 1.0);
   --  R_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, -1.0, -1.0, 2.0);
   --  R_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, -2.0, 1.0);
   --  R_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 2.0, -1.0, -1.0);
   --  R_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);

   --  -- the unit cube
   --  Ada.Text_IO.Put_Line ("Plot");
   --  Plane_Tessellation.Set (Tess, 0.0, 0.0, 0.0);
   --  Q_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, 0.0, 0.0);
   --  Q_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 0.0, 1.0, 0.0);
   --  Q_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 0.0, 0.0, 1.0);
   --  Q_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, 1.0, 0.0);
   --  Q_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 0.0, 1.0, 1.0);
   --  Q_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, 0.0, 1.0);
   --  Q_Vector.Append (Plane_Tessellation.Point_Constructor(Tess));
   --  Plane_Tessellation.Print_Transform_Image (Tess);
   --  Plane_Tessellation.Set (Tess, 1.0, 1.0, 1.0);
   
   --  Plane_Tessellation.Print_R_Plot (P_Vector);
   --  Plane_Tessellation.Print_R_Plot (Q_Vector);
   --  Plane_Tessellation.Print_R_Plot (R_Vector);


   
end Triangular_Tessellation_Binary_Trees;
