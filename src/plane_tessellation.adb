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
      Coordinates.X := (This.A - This.C) / 2.0;
      Coordinates.Y := Sqrt(3.0) * This.B / 2.0;
      return Coordinates;
   end To_Cartesian;

   procedure Set(This: PlTess_Access; a, b, c : Float) is 
   begin
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
         
   function Point_Constructor (a, b, c : Float) return PlTess_Access is
      point : PlTess_Access := new pltess;
   begin
      Set (point, a, b, c);
      return point;
   end Point_Constructor;

   function Point_Constructor (p : PlTess_Access) return PlTess_Access is
   begin
      return Point_Constructor (p.A, p.B, p.C);
   end Point_Constructor;
      
end Plane_Tessellation;