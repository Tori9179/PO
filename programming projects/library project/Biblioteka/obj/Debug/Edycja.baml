   M S B A M L   `   `   `  ����E  ABiblioteka, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:Biblioteka
Biblioteka  5   	       Biblioteka.Edycja   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:Biblioteka     5   	   -   5          � Title$  Libriv��5   	   $	��450��6   $	��800��6%   .��5	      � .+�5
   
   �� -   5         ��Name$ ImageEdytuj��5
      $
��Left=�6%   $	��181��6@   $��	83,72,0,0q�6M   $	��Top=�6`   $	��127��6x   �� 5   
   -   5         ��Name$ tytulEdycja_TextBox��5      $
��Left=�6/   $��22��6J   $��
256,59,0,0q�6V    �� TextWrapping$
 Wrap=�6j   $��Tytuł��6~   $	��Top=�6�   $	��235��6�   6�   �� 5   
   -   5        $ autorEdycja_TextBox��5      $
��Left=�6/   $��22��6J   $��
256,89,0,0q�6V   $
 Wrap=�6j   $��Autor��6~   $	��Top=�6�   $	��235��6�   6�   �� 5   
   -   5         ��Name$ takEdytuj_CheckBox��5      $	��Tak��6/   $
��Left=�6=   $��32��6X   $��256,190,0,0q�6d   $	��Top=�6y   $	��193��6�   6�   �� 5   
   -   5        $ nieEdytuj_CheckBox��5      $	��Nie��6/   $
��Left=�6=   $��31��6X   $��256,222,0,0q�6d   $	��Top=�6y   $	��193��6�   6�   �� 5   
   $��Czy przeczytano?��6   $
��Left=�6+   $��29��6F   $��256,156,0,0q�6R   $	��Top=�6g   $	��187��6   �� 5   
   $��Edytuj ocenę��6   $
��Left=�6'   $��29��6B   $��256,253,0,0q�6N   $	��Top=�6c   $	��187��6{   �� 5   
   -   5         ��Name$ suwakEdytuj��5      $
��Left=�6&    � Maximum$ 6Q�6A    �� TickPlacement$ BottomRight=�6N    �� TickFrequency$ 1Q�6j   	 �� IsSnapToTickEnabled	 . $��23��6�   $��256,287,0,0q�6�   $	��Top=�6�   $	��166��6�   �� 5   
   -   5        
 ��Name$
 zapiszEdytuj_Button��5      $��Zapisz��6.   $
��Left=�6?   $��35��6Z   $��501,357,0,0q�6f   $	��Top=�6{   $	��161��6�   ���	#FF39E6286�   �� 5   
   -	   5        $
 dodajGrafikeEdytuj_Button��5      $��Dodaj grafikę��64   $
��Left=�6L   $��35��6g   $��
84,275,0,0q�6s   $	��Top=�6�   $	��126��6�   6�   �� 5   
   -
   5        $ spisEdytuj_CheckBox��5      $��spis książek��60   $
��Left=�6G   $��32��6b   $��518,190,0,0q�6n   $	��Top=�6�   $	��193��6�   6�   �� 5   
   -   5        $ listaEdytuj_CheckBox��5      $��moja lista życzeń��61   $
��Left=�6M   $��31��6h   $��518,222,0,0q�6t   $	��Top=�6�   $	��193��6�   6�   �� 5   
   $&�� Wybierz rodzaj dodawanej pozycji��6   $
��Left=�6;   $��29��6V   $��518,156,0,0q�6b   $	��Top=�6w   $	��193��6�   �� 5   
   -   5         ��Name$ GatunkiEdycja_ComboBox��5      $
��Left=�5      $��22��5      $��256,118,0,0q�5      $	��Top=�5      $	��235��5       �� 
IsEditable .  �� 
IsReadOnly .  �� Text$ Gatunki��5      .@�5       �� .��6   Dramat6#   �� 5!      .��6   	Fantasy6$   �� 5"      .��6   Horror6#   �� 5#      .��6   	Komedia6$   �� 5$      .��6   	Komiksy6$   �� 5%      .��6   	Kryminał6%   �� 5&      .��6   Literatura dziecięca61   �� 5'      .��6   Literatura faktu6-   �� 5(      .��6   Literatura młodzieżowa63   �� 5)      .��6   Literatura piękna6.   �� 5*      .��6   Literatura popularnonaukowa68   �� 5+      .��6   Poezja6#   �� 5,      .��6   Powieść historyczna60   �� 5-      .��6   Powieść przygodowa6/   �� 5.      .��6   	Romance6$   �� 5/      .��6   Science-fiction6,   �� 50      .��6   Utwór dramatyczny6.   �� 51      .��6   
Pozostałe6&   52      �� 53   
   -   5        $ ocenaEdytuj_TextBox��53      $
��Left=�6/   $��18��54      $��427,287,0,0q�55      $
 Wrap=�56      $	��Top=�57      $��16��58       J� RenderTransformOrigin$ 
0.7,-1.022&�59      ��5:      �� *Value+ �� ElementName$ suwakEdytuj���� 5;   
   -   5         ��Name$ opisEdytuj_RichTextBox��5;      $
��Left=�66   $��81��6Q   $��
518,59,0,0q�6]   $	��Top=�6q   $	��182��6�   . �5<      /� .T�5=      J� .*�6   .*�5>      �� $�Krótki opis��6   5?      5@      5A      �� 5B   
   -   5        $
 anulujEdytuj_Button��5B      $��Anuluj��6.   $
��Left=�6?   $��35��6Z   $��321,357,0,0q�6f   $	��Top=�6{   $	��161��6�   6�   �� 5C   
   -   5        $
 usunEdytuj_Button��5C      $��Usuń��6,   $
��Left=�6;   $��35��6V   $��
67,357,0,0q�6b   $	��Top=�6v   $	��161��6�   ���#F781816�   5D      5E      