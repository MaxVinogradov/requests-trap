class RequestsController < ApplicationController
  def statistic
    logger.info 'Statistic for trap: ' + params['trap_id'].inspect
  end
end
