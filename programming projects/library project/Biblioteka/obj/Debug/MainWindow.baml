   M S B A M L   `   `   `  ����E  ABiblioteka, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:Biblioteka
Biblioteka  5   	       Biblioteka.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:Biblioteka     5   	   -   5          � Title$  Libriv��5   	   $	��450��6   $	��800��6%   .��5	      � .+�5
   
   �� -   5        $��Dodaj pozycję��5
      $
��Left=�6)   $��35��6D   $��
500,23,0,0q�6P   $	��Top=�6d   $	��161��6|   6�   �� 5   
   $��Spis książek��6   $
��Left=�6(   $��35��6C   $��
138,23,0,0q�6O   $	��Top=�6c   $	��161��6{   ���	#FF51D4C86�   �� 5   
   -   5        $��Moja lista życzeń��5      $
��Left=�6-   $��35��6H   $��
319,23,0,0q�6T   $	��Top=�6h   $	��161��6�   6�   �� 5   
   -   5         ��Name$ ListViewSpis��5      $
��Left=�5      $	��295��5      $��
191,86,0,0q�5      $	��Top=�5      $	��568��5       �� View 5      �� 5      .P�5      ��  �� Width$	 215��6%    �� DisplayMemberBinding 61   �� *Tytul+��5      �� 5      -   5        
 � Tag$ Tytul��5   3   .��6R   Tytuł6Y   5      �� 5      $	 160��6%    61   �� *Autor+��5      �� 5      -   5        $ Autor��5   3   .��6R   Autor6Y   5      �� 5       $	 120��6%    61   �� *	Gatunek+��5!      �� 5"      -   5        $ Gatunek��5"   3   .��6T   	Gatunek6]   5$      �� 5%      $ 70��6%    60   �� *Ocena+��5&      �� 5'      -   5        $ Ocena��5'   3   .��6R   Ocena6Y   5)      5*      5,      �� 5.   
   -	   5         ��Name$ SliderOcena��5.      $
��Left=�6&    � Maximum$ 6Q�5/       �� TickPlacement$ BottomRight=�50      	 �� TickFrequency$	 1Q�51      
 �� IsSnapToTickEnabled
 . $��24��53      $��
20,324,0,0q�54      $	��Top=�55      $	��150��56      57      �� 58   
   -
   5         ��Name$ Ocena_TextBox��58      $
��Left=�59      $��18��5;      $��105,301,0,0q�6    �� TextWrapping$
 Wrap=�63   $	��Top=�6G   $��16��6_    J� RenderTransformOrigin$ -9.156,-3.694&�6j   ��5:      �� *Value+ �� ElementName$ SliderOcena��5;   j   �� 5<   
   $��Gatunek��6   $
��Left=�5=      $��28��5>      $��
20,216,0,0q�5?      $	��Top=�5@      $	��193��5A      �� 5B   
   $��Wybierz ocenę��6   $
��Left=�5C      $��28��5D      $��
13,296,0,0q�5E      $	��Top=�5F      $	��193��5G      �� 5H   
   $��Tytuł��6   $
��Left=�5I      $��28��5J      $��	20,86,0,0q�5K      $	��Top=�5L      $	��193��5M      �� 5N   
   $��Autor��6   $
��Left=�5O      $��28��5P      $��
20,150,0,0q�5Q      $	��Top=�5R      $	��193��5S      �� 5T   
   -   5        $ TextBoxTytul_Wyszukaj��5T      $
��Left=�61   $��20,114,0,280.5q�6L   $	��150��6d   6p   �� 5U   
   -   5        $ TextBoxAutor_Wyszukaj��5U      $
��Left=�61   $��20,178,0,216.5q�6L   $	��150��6d   6q   �� 5V   
   -   5        $ TextBoxGatunek_Wyszukaj��5V      $
��Left=�63   $��20,244,0,150.5q�6N   $	��150��6f   6s   5W      5X      