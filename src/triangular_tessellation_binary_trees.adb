--  Abstract Machine
--  © Reed Lake Axewielder 2025

with Ada.Text_IO;
with Binary_Tree;
with Tree_Node;
with Plane_Tessellation;

procedure Triangular_Tessellation_Binary_Trees is
   Tape : Binary_Tree.Tree_Access := new Binary_Tree.btree;
   Tess : Plane_Tessellation.PlTess_Access := new Plane_Tessellation.pltess;
   P_Vector : Plane_Tessellation.Point_Vector.Vector;
   Q_Vector : Plane_Tessellation.Point_Vector.Vector;
   R_Vector : Plane_Tessellation.Point_Vector.Vector;
   -- Graph : Plane_Tessellation.Point_Vector.Vector;
begin
   Binary_Tree.Initialization (Tape, 0);

   Binary_Tree.Print_Tree (Tape.Root);

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
