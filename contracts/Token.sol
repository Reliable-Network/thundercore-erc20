p r a g m a   s o l i d i t y   ^ 0 . 5 . 017; 
 
 / /   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 / /   E R C   T o k e n   S t a n d a r d   # 2 0   I n t e r f a c e 
 / / 
 / /   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 c o n t r a c t   E R C 2 0 I n t e r f a c e   { 
         f u n c t i o n   t o t a l S u p p l y ( )   p u b l i c   v i e w   r e t u r n s   ( u i n t ) ; 
         f u n c t i o n   b a l a n c e O f ( a d d r e s s   t o k e n O w n e r )   p u b l i c   v i e w   r e t u r n s   ( u i n t   b a l a n c e ) ; 
         f u n c t i o n   a l l o w a n c e ( a d d r e s s   t o k e n O w n e r ,   a d d r e s s   s p e n d e r )   p u b l i c   v i e w   r e t u r n s   ( u i n t   r e m a i n i n g ) ; 
         f u n c t i o n   t r a n s f e r ( a d d r e s s   t o ,   u i n t   t o k e n s )   p u b l i c   r e t u r n s   ( b o o l   s u c c e s s ) ; 
         f u n c t i o n   a p p r o v e ( a d d r e s s   s p e n d e r ,   u i n t   t o k e n s )   p u b l i c   r e t u r n s   ( b o o l   s u c c e s s ) ; 
         f u n c t i o n   t r a n s f e r F r o m ( a d d r e s s   f r o m ,   a d d r e s s   t o ,   u i n t   t o k e n s )   p u b l i c   r e t u r n s   ( b o o l   s u c c e s s ) ; 
 
         e v e n t   T r a n s f e r ( a d d r e s s   i n d e x e d   f r o m ,   a d d r e s s   i n d e x e d   t o ,   u i n t   t o k e n s ) ; 
         e v e n t   A p p r o v a l ( a d d r e s s   i n d e x e d   t o k e n O w n e r ,   a d d r e s s   i n d e x e d   s p e n d e r ,   u i n t   t o k e n s ) ; 
 } 
 
 / /   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 / /   S a f e   M a t h   L i b r a r y   
 / /   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 c o n t r a c t   S a f e M a t h   { 
         f u n c t i o n   s a f e A d d ( u i n t   a ,   u i n t   b )   p u b l i c   p u r e   r e t u r n s   ( u i n t   c )   { 
                 c   =   a   +   b ; 
                 r e q u i r e ( c   > =   a ) ; 
         } 
         f u n c t i o n   s a f e S u b ( u i n t   a ,   u i n t   b )   p u b l i c   p u r e   r e t u r n s   ( u i n t   c )   { 
                 r e q u i r e ( b   < =   a ) ;   c   =   a   -   b ;   }   f u n c t i o n   s a f e M u l ( u i n t   a ,   u i n t   b )   p u b l i c   p u r e   r e t u r n s   ( u i n t   c )   {   c   =   a   *   b ;   r e q u i r e ( a   = =   0   | |   c   /   a   = =   b ) ;   }   f u n c t i o n   s a f e D i v ( u i n t   a ,   u i n t   b )   p u b l i c   p u r e   r e t u r n s   ( u i n t   c )   {   r e q u i r e ( b   >   0 ) ; 
                 c   =   a   /   b ; 
         } 
 } 
 
 
 c o n t r a c t   R e l i a b l e NetworkT o k e n   i s   E R C 2 0 I n t e r f a c e ,   S a f e M a t h   { 
         s t r i n g   p u b l i c   n a m e ; 
         s t r i n g   p u b l i c   s y m b o l ; 
         u i n t 8   p u b l i c   d e c i m a l s ;   / /   1 8   d e c i m a l s   i s   t h e   s t r o n g l y   s u g g e s t e d   d e f a u l t ,   a v o i d   c h a n g i n g   i t 
         
         u i n t 2 5 6   p u b l i c   _ t o t a l S u p p l y ; 
         
         m a p p i n g ( a d d r e s s   = >   u i n t )   b a l a n c e s ; 
         m a p p i n g ( a d d r e s s   = >   m a p p i n g ( a d d r e s s   = >   u i n t ) )   a l l o w e d ; 
         
         / * * 
           *   C o n s t r c t o r   f u n c t i o n 
           * 
           *   I n i t i a l i z e s   c o n t r a c t   w i t h   i n i t i a l   s u p p l y   t o k e n s   t o   t h e   c r e a t o r   o f   t h e   c o n t r a c t 
           * / 
         c o n s t r u c t o r ( )   p u b l i c   { 
                 n a m e   =   " R e l i a b l e Network" ; 
                 s y m b o l   =   " R AN" ; 
                 d e c i m a l s   =   1 8 ; 
                 _ t o t a l S u p p l y   =   1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; 
                 
                 b a l a n c e s [ m s g . s e n d e r ]   =   _ t o t a l S u p p l y ; 
                 e m i t   T r a n s f e r ( a d d r e s s ( 0 ) ,   m s g . s e n d e r ,   _ t o t a l S u p p l y ) ; 
         } 
         
         f u n c t i o n   t o t a l S u p p l y ( )   p u b l i c   v i e w   r e t u r n s   ( u i n t )   { 
                 r e t u r n   _ t o t a l S u p p l y     -   b a l a n c e s [ a d d r e s s ( 0 ) ] ; 
         } 
         
         f u n c t i o n   b a l a n c e O f ( a d d r e s s   t o k e n O w n e r )   p u b l i c   v i e w   r e t u r n s   ( u i n t   b a l a n c e )   { 
                 r e t u r n   b a l a n c e s [ t o k e n O w n e r ] ; 
         } 
         
         f u n c t i o n   a l l o w a n c e ( a d d r e s s   t o k e n O w n e r ,   a d d r e s s   s p e n d e r )   p u b l i c   v i e w   r e t u r n s   ( u i n t   r e m a i n i n g )   { 
                 r e t u r n   a l l o w e d [ t o k e n O w n e r ] [ s p e n d e r ] ; 
         } 
         
         f u n c t i o n   a p p r o v e ( a d d r e s s   s p e n d e r ,   u i n t   t o k e n s )   p u b l i c   r e t u r n s   ( b o o l   s u c c e s s )   { 
                 a l l o w e d [ m s g . s e n d e r ] [ s p e n d e r ]   =   t o k e n s ; 
                 e m i t   A p p r o v a l ( m s g . s e n d e r ,   s p e n d e r ,   t o k e n s ) ; 
                 r e t u r n   t r u e ; 
         } 
         
         f u n c t i o n   t r a n s f e r ( a d d r e s s   t o ,   u i n t   t o k e n s )   p u b l i c   r e t u r n s   ( b o o l   s u c c e s s )   { 
                 b a l a n c e s [ m s g . s e n d e r ]   =   s a f e S u b ( b a l a n c e s [ m s g . s e n d e r ] ,   t o k e n s ) ; 
                 b a l a n c e s [ t o ]   =   s a f e A d d ( b a l a n c e s [ t o ] ,   t o k e n s ) ; 
                 e m i t   T r a n s f e r ( m s g . s e n d e r ,   t o ,   t o k e n s ) ; 
                 r e t u r n   t r u e ; 
         } 
         
         f u n c t i o n   t r a n s f e r F r o m ( a d d r e s s   f r o m ,   a d d r e s s   t o ,   u i n t   t o k e n s )   p u b l i c   r e t u r n s   ( b o o l   s u c c e s s )   { 
                 b a l a n c e s [ f r o m ]   =   s a f e S u b ( b a l a n c e s [ f r o m ] ,   t o k e n s ) ; 
                 a l l o w e d [ f r o m ] [ m s g . s e n d e r ]   =   s a f e S u b ( a l l o w e d [ f r o m ] [ m s g . s e n d e r ] ,   t o k e n s ) ; 
                 b a l a n c e s [ t o ]   =   s a f e A d d ( b a l a n c e s [ t o ] ,   t o k e n s ) ; 
                 e m i t   T r a n s f e r ( f r o m ,   t o ,   t o k e n s ) ; 
                 r e t u r n   t r u e ; 
         } 
 } 
 
