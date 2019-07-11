#include<iostream>
#include <cmath>
     
using namespace std; 

const int Queue_Limit=100;
const int BUSY=1;
const int IDLE=0;
 
int  
      Num_Delayed,    //Number of Completed Customers
      Num_of_Events,           //Number of Events 1.Arriving 2.Completion
      Number_waiting,            //Number of Customers In Queue
      Server_Status;              //Server Status ( Idle , Busy )

double
      next_event_type,
      Mean_interArrival_Time, 
      Mean_service_Time,
      Sim_Clock, 
      Time_Arrival[Queue_Limit + 1], ////////Array holding arrival time of ones waiting in the queue
      Service_Time[Queue_Limit + 1], 
      Next_Arrival, 
      Next_service,
      Next_Departure,
      Waiting_Time, 
	  Delay,
	  Utilization_Time,
	  Area_Utilization,
	  Time_Free,
	  Time_Busy;

void initialize (void);
void timing (void);
void  Arrival(void);
void Departure(void);
float expon(void);
float expon2(void);

///////////////////////main//////////////////////////
 
int main()  
{
        cout<<"                 * Single-server queueing system with fixed run *\n";
    initialize();           // Intialization of the System
 
 
  
     
    while(Num_Delayed<6)
    {
         
        timing();  // Timing Routine To Determine The Next Event
 
        switch (int(next_event_type)) 
        {
         
        case 1:
            Arrival();
            break;
             
        case 2:
            Departure();
            break;
        }
    } 
      
    // Print Summary Statistics.
     
     
     
    cout<<"\nTotal Waiting Time in Queue: "<<Waiting_Time;

    cout<<"\nNumber of Delayed Customers: "<<Num_Delayed;
  
    cout<<"\nAverage Waiting Time in Queue: "<<Waiting_Time / Num_Delayed;
	cout<<"\nClock Status: "<<Sim_Clock;
    
	Area_Utilization = Sim_Clock - Utilization_Time;
	
	
	cout<<"\nArea Utilization: "<<Area_Utilization;
	return 0;
}
 




//////////////////////////////initialize////////////////////
void initialize()  
{
 
    Num_of_Events = 2;      // Arrival , Completion
     
    Mean_interArrival_Time=1.0;
     
    Mean_service_Time=0.5;
    Sim_Clock = 0.0;
     
    Server_Status = IDLE;
	Time_Free = Sim_Clock; 
    Utilization_Time=0; 
	Number_waiting = 0;
 
    Num_Delayed = 0;
 
  /*  Total_Flow_Time = 0.0; */
 
    Waiting_Time = 0.0;
    
    Delay = 0.0;
 
    Next_Arrival = Sim_Clock + expon();         //Arriving
     
    Next_service = expon2();
     
    Next_Departure = 1.0e+10;    // Completing  Guarantening that the first event is arriving 
}

/////////////////////////timing/////////////////////////////////////
void timing()  
{
    next_event_type = 0;
 
    if(Next_Arrival < Next_Departure)
    {
         
        next_event_type = 1;
         
        Sim_Clock= Next_Arrival;
 
    }
     
    else
    {
        next_event_type = 2;
 
        Sim_Clock = Next_Departure;
 
    }
     
    if (next_event_type == 0) 
    {
        cout<<"\nEvent List Empty at Time: "<<Sim_Clock;
        exit(1);
    }       
 
}
 
/////////////////////////arrival////////////////////////////

void Arrival()  
{
    if (Server_Status == BUSY) 
    {
        ++Number_waiting;
		 
        if (Number_waiting > Queue_Limit) 
        {
            cout<<"\nOverflow of the array time_arrival at";
             
            cout<<"time: "<<Sim_Clock;
             
            exit(2);
        }
 
        Time_Arrival[Number_waiting] = Sim_Clock;
 		
        Service_Time[Number_waiting] = Next_service;
    }
 
    else
    {
        Server_Status = BUSY;
        Time_Busy = Sim_Clock;
        ++Num_Delayed;
        Next_Departure = Sim_Clock + Next_service;
  		Utilization_Time = Utilization_Time + (Time_Busy-Time_Free);
    }
 
    Next_Arrival = Sim_Clock + expon();
 
    Next_service = expon2();

}

//////////////////////////////////////departure///////////////////////////////////
void Departure(void) 
{
 
    if (Number_waiting == 0) 
    {
        Server_Status= IDLE;
 
        Next_Departure = 1.0e+10;      // High Value
        Time_Free = Sim_Clock;
    }
 
    else
    {
 		++Num_Delayed;
        Delay= Sim_Clock - Time_Arrival[1];
 
        Waiting_Time+= Delay;
     
        Next_Departure = Sim_Clock + Service_Time[1]; 
 
      
        --Number_waiting;
         
        for (int i=1;i<=Number_waiting;i++)
        {
            Time_Arrival[i] = Time_Arrival[i + 1];
             
            Service_Time[i] = Service_Time[i + 1];
        }
         
    }
}

///////////////////////////expon_inputs//////////////////////////

float expon(void)  
{
	float x ;
	cout<<"\nEnter next inter-arrival time: ";
	cin>>x;
    return x;
}

float expon2(void)  
{
	float y ;
	cout<<"\nEnter next service time: ";
	cin>>y;
    return y;
}

///////////////////////////report////////////////////////////


