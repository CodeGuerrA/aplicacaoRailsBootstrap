class BookPolicy < ApplicationPolicy
#colocar create, delete e edit 
#admin pode editar, excluir, criar livros
def update?
user.admin?
end

def destroy?
  user.admin?
end

def create? 
  user.admin?
end

  class Scope < ApplicationPolicy::Scope
   def resolve
      scope.all  # todo mundo vê todos os livros
    end
    
  end

end
