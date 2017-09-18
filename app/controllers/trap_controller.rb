class TrapController < ApplicationController

  def visit
    logger.info 'Visited: ' + params['trap_id'].inspect
  end

end
