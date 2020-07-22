module RelatorioHelper
  extend ActiveSupport::Concern
  
  included do
    # PROJECT
    def average_exception_solved(project)
    end

    def average_exception_solved_per_member(project)
    end

    def new_exceptions_per_month(project)
    end

    def exceptions_solved_per_month(project)
    end

    # MEMBER

    def member_exception_solved(developer)
    end

    def member_average_time_exception_solved(developer)
    end

    def member_exception_solved_per_month(developer)
    end
  end
end