module RelatorioHelper
  extend ActiveSupport::Concern
  
  included do
    # PROJECT
    def average_exception_solved(project)
      time = 0
      count = 0
      project.excecaos.each do |excecao|
        if excecao.dono_excecao.solved
          time += ((excecao.dono_excecao.updated_at - excecao.dono_excecao.created_at)/ 1.hour).to_i
          count += 1
        end
      end

      return time / count
    end

    def average_exception_solved_per_member(project)
      developers = []
      time_developer = []
      project.team.developers.each do |developer|
        developers.push(developer.email)
        count = 0
        time = 0
        developer.dono_excecaos.each do |dono_excecao|
          if dono_excecao.solved && dono_excecao.excecao.project_id == project.id 
            time += ((dono_excecao.excecao.dono_excecao.updated_at - dono_excecao.excecao.dono_excecao.created_at)/ 1.hour).to_i
            count += 1
          end
        end
        time_developer.push(time / count)
      end
      return { developers: developers, time: time_developer }
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