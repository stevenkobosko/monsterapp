class MonstersController < ApplicationController
	def list
		@monsters = Monster.all
		if params[:sortby] == 'name'
			@monsters = @monsters.sort_by{|m| m.name}
		elsif params[:sortby] == 'power'
			@monsters = @monsters.sort_by{|m| m.power}
		elsif params[:sortby] == 'monstertype_id'
			@monsters = @monsters.sort_by{|m| m.monstertype_id}
		end
		@monstertypes = MonsterType.all
	end
	def show
		@monster = Monster.find(params[:id])
	end
	def new
		@monster = Monster.new
		@monstertypes = MonsterType.all
	end
	def create
		@monster = Monster.new(monsters_params)
		if @monster.save
			redirect_to :action => 'list'
		else
			@monstertypes = MonsterType.all
			render :action => 'new'
		end
	end
	def edit
		@monster = Monster.find(params[:id])
		@monstertypes = MonsterType.all
	end
	def update
		@monster = Monster.find(params[:id])
		if @monster.update_attributes(monster_params)
			redirect_to :action => 'show', :id => @monster
		else
			@monstertypes = MonsterType.all
			render :action => 'edit', :id => @monster
		end
	end
	def delete
		Monster.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	def show_types
		@monstertype = MonsterType.find(params[:id])
	end
	private
		def monsters_params
			params.require(:monsters).permit(:name, :power, :monstertype_id)
		end
		def monster_params
			params.require(:monster).permit(:name, :power, :monstertype_id)
		end
end
