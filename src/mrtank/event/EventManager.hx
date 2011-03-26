/**
mr_tank - A tank game written with haXe    
Copyright (C) 2010 Jonathan Frawley

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
**/

package mrtank.event;

//TODO : Add a map from types to handlers, this will make things faster.
class EventManager
{
	private var m_Listeners:List<IEventListener>;
	private var m_Events:List<IEvent>;
	private static var m_Instance:EventManager = new EventManager("EventManager");

	private function new(pName:String)
	{
		m_Listeners = new List<IEventListener>();
		m_Events = new List<IEvent>();
	}

	public function AddListener(inHandler:IEventListener, inType:EventType) : Bool
	{
		m_Listeners.remove(inHandler); //TODO:Remove hack, make a map
		m_Listeners.add(inHandler);	
		return true;
	}
	
	public function DelListener(inHandler:IEventListener, inType:EventType) : Bool
	{
		m_Listeners.remove(inHandler);
		return true;
	}

	/**
	 * Trigger event to go off now!
	 */
	public function Trigger(inEvent:IEvent) : Bool
	{
		for(listener in m_Listeners)
		{
			listener.HandleEvent(inEvent);
		}
		return true;
	}

	/**
	 * Queue Event to go off next iteration.
	 */
	public function QueueEvent(inEvent:IEvent) : Bool
	{
		m_Events.add(inEvent);
		return true;
	}

	public function RemoveEvent(inEvent:IEvent) : Bool
	{
		m_Events.remove(inEvent);
		return true;
	}

	public function Tick(maxMillis:Int=0xffffffff) : Bool
	{
		//TODO : impose time limit
		while( ! m_Events.isEmpty())
		{
			var event : IEvent = m_Events.pop();
			for(listener in m_Listeners)
			{
				listener.HandleEvent(event);
			}
		}
		return true;
	}

	static public function GetInstance() : EventManager
	{
		return m_Instance;
	}
}
