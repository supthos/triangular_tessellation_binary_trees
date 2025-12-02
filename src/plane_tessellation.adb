with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Strings;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Text_IO;
package body Plane_Tessellation is



   function To_Cartesian(This: PlTess_Access) return Cartesian_Plane.cartesian is
      Coordinates : Cartesian_Plane.cartesian;
   begin
      -- Coordinates.X := (This.A - This.C) / 2.0;
      -- Coordinates.Y := Sqrt(3.0) * This.B / 2.0;
      -- This is a more general formula than the above, because it illustrates the 
      -- reasoning behind the choice of coordinates. As long as the angles correspond to a
      -- rotation of the angles of the n roots of unity (in this case n equals 3), the 
      -- formula will hold for any n, if I'm not mistaken. I should probable include a proof.
      -- But for the case of n equals 3, it works.
      -- Coordinates.Y := ((Sin (-30.0,360.0) * This.A) + (Sin (90.0,360.0) * This.B) + (Sin (210.0,360.0) * This.C) ) / Sqrt (3.0) ;
      -- Coordinates.X := ((Cos (-30.0,360.0) * This.A) + (Cos (90.0,360.0) * This.B) + (Cos (210.0,360.0) * This.C) ) / Sqrt (3.0) ;
      -- Even though the second formula above works, it obfuscates the essence of the work
      -- being done here. This third formula is somewhat more straight forward with the 
      -- added benefit that the points of the unit cube map to the points of the second formula.
      Coordinates.Y := ((Sin (0.0,360.0) * This.A) + (Sin (120.0,360.0) * This.B) + (Sin (240.0,360.0) * This.C) ) ;
      Coordinates.X := ((Cos (0.0,360.0) * This.A) + (Cos (120.0,360.0) * This.B) + (Cos (240.0,360.0) * This.C) ) ;

      return Coordinates;
   end To_Cartesian;

   procedure Set(This: in out PlTess_Access; a, b, c : Float) is 
   begin
      if This = null then
         This := new pltess;
      end if;
      This.A := a;
      This.B := b;
      This.C := c;
   end Set;

   procedure Print_Transform  (This: PlTess_Access) is
      Cart : Cartesian_Plane.cartesian;
   begin
      Cart := To_Cartesian (This);
      Ada.Text_IO.Put_Line ("(" & Float'Image(This.A) & "," & Float'Image(This.B) & "," & Float'Image(This.C) & ") -> (" &  Float'Image(Cart.X) & "," & Float'Image(Cart.Y) & ")");
   end Print_Transform;

   procedure Print_Transform_Image  (This: PlTess_Access) is
      Cart : Cartesian_Plane.cartesian;
   begin
      Cart := To_Cartesian (This);
      Ada.Text_IO.Put_Line ("(" & Float'Image(Cart.X) & "," & Float'Image(Cart.Y) & ")");
   end Print_Transform_Image;

   procedure Print_Transform_Image_2  (This: PlTess_Access) is
      Cart : Cartesian_Plane.cartesian;
   begin
      Cart := To_Cartesian (This);
      Ada.Text_IO.Put_Line ( Float'Image(Cart.X) & "," & Float'Image(Cart.Y) ) ;
   end Print_Transform_Image_2;

   procedure Print_R_Plot (Points: Point_Vector.Vector) is
      XList : Unbounded_String;
      YList : Unbounded_String;
      Cart : Cartesian_Plane.cartesian;
   begin
      for point of Points loop
         Cart := To_Cartesian (point);
         Append ( Xlist, Float'Image(Cart.X)) ;
         Append ( Ylist, Float'Image(Cart.Y)) ;
         if point /= Points.Last_Element then
            Append (XList, ",");
            Append (YList, ",");
         end if;
      end loop;
      Ada.Text_IO.Put_Line ("plot(c(" & To_String(XList) & "), c(" & To_String(YList) & "))");
   end Print_R_Plot;
         
   procedure Print_Point (Point : pltess) is
   begin 
      Ada.Text_IO.Put_Line ("(" & Float'Image(Point.A) & ", " & Float'Image(Point.B) & ", " & Float'Image(Point.C) & ")");
   end Print_Point;

   function Point_Constructor (a, b, c : Float) return PlTess_Access is
      point : PlTess_Access := new pltess;
   begin
      Set (point, a, b, c);
      return point;
   end Point_Constructor;

   function Point_Constructor (p : pltess) return PlTess_Access is
   begin
      return Point_Constructor (p.A, p.B, p.C);
   end Point_Constructor;

   function Point_Constructor (p : PlTess_Access) return PlTess_Access is
   begin
      return Point_Constructor (p.all);
   end Point_Constructor;
      
   function Adjacents (This : PlTess_Access) return Point_Vector.Vector is
      List : Point_Vector.Vector;
   begin
      List.Append (Point_Constructor(This.A + 1.0, This.B, This.C - 1.0));
      List.Append (Point_Constructor(This.A, This.B + 1.0, This.C - 1.0));
      List.Append (Point_Constructor(This.A - 1.0, This.B + 1.0, This.C));
      List.Append (Point_Constructor(This.A - 1.0, This.B, This.C + 1.0));
      List.Append (Point_Constructor(This.A, This.B - 1.0, This.C + 1.0));
      List.Append (Point_Constructor(This.A + 1.0, This.B - 1.0, This.C));
      return List;
   end Adjacents;

   function "+" (L,R: pltess) return pltess is 
      buf : pltess;
   begin
      buf.A := L.A + R.A;
      buf.B := L.B + R.B;
      buf.C := L.C + R.C;
      return buf;
   end "+";

   function "-" (L,R: pltess) return pltess is 
      buf : pltess;
   begin
      buf.A := L.A - R.A;
      buf.B := L.B - R.B;
      buf.C := L.C - R.C;
      return buf;
   end "-";
   function "=" (L,R: pltess) return Boolean is
   begin
      if (L.A = R.A) and (L.B = R.B) and (L.C = R.C) then
         return true;
      else
         return False;
      end if;
   end "=";

end Plane_Tessellation;