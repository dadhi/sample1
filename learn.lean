abbrev N := Nat
def max2 (x: N) (y : N) : N :=
  if x > y then
    x
  else
    y

structure Point where
  new ::
  x : Float
  y : Float
deriving Repr

instance : ToString Point where
  toString p := s!"(Point.mk {p.x} {p.y})"

def p := Point.new 1.0 2.0
def p2 : Point := { x:= 1.0, y := 2.0 }

inductive Bool2 where
  | false
  | true
deriving Repr

instance : ToString Bool2 where
  toString
    | Bool2.false => "false"
    | Bool2.true => "true"

def b := Bool2.true

#eval s!"bool: {b}"

inductive Sign where
  | pos
  | neg

def posOrNegThree (s : Sign) : match s with | Sign.pos => Nat | Sign.neg => Int :=
  match s with
  | Sign.pos => (3 : Nat)
  | Sign.neg => (-3 : Int)

def ps := (posOrNegThree Sign.neg)

#eval s!"posOrNegThree: {ps}"


def list := [1, 2, 0]
def printNonEmptyList : (l : List Nat) -> IO Unit
  | List.nil => IO.println "empty"
  | _ => IO.println "non-empty"
#eval printNonEmptyList []


def five0 := ("five", 0)

abbrev PetName : Type := String ⊕ String
def pn : PetName := Sum.inr "Rex"
